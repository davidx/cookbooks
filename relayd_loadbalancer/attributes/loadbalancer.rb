


set_unless[:loadbalancer][:ext_if] = {

        :name => 'em0',
        :ip => '10.10.10.171',
        :netmask => '255.255.255.0',

        :carp => {
                :name => 'carp0',
                :ip => '10.10.10.170',
                :netmask => '255.255.255.0',
                :broadcast => '10.10.10.255',
                :password => 'o2193i4dj2o3id'
        }
}

set_unless[:loadbalancer][:int_if] = {

        :name => 'em1',
        :ip => '10.0.0.11',
        :netmask => '255.255.255.0',

        :carp => {
                :name => 'carp1',
                :ip => '10.0.0.10',
                :netmask => '255.255.255.0',
                :broadcast => '10.0.0.255',
                :password => 'o2wewewe234ewfd'

        }
}
set_unless[:loadbalancer][:pfsync_if] = {

        :name => 'rl0',
        :ip => '172.16.0.10',
        :netmask => '255.255.255.0'

}

set_unless[:loadbalancer][:relayd] = {
        :macros => {
                'relayd_addr' => "127.0.0.1",
                'relayd_port' => "8080"
        },
        :tables => { 'web_hosts' => %w[10.10.10.11 10.10.10.22] },
        :options => {
                'interval' => 10,
                'timeout' => 200,
                'prefork' => 5,
                'log' => 'updates'
        },
        :relay => { :httpproxy => {
                :listen => [ "on $relayd_addr port $relayd_port" ],
                :forward => [ "to <web_hosts> port $web_port mode loadbalance check http "/" code 200" ]

        }
        }

}
set_unless[:loadbalancer][:pf] = {
        :macros => {
                'ext_if' => set_unless[:loadbalancer][:ext_if][:name],
                'int_if' => set_unless[:loadbalancer][:int_if][:name],
                'pfsync_if' => set_unless[:loadbalancer][:pfsync_if][:name]
        },
        :tables => {},
        :options => {
                'block-policy' => 'return',
                'loginterface' => '$ext_if',
                'skip on' => 'lo'
        },
        :scrub => ["in" ],
        :nat => [
                "on $ext_if from any to any -> ($ext_if)"
        ],
        :nat_anchor => ["relayd/*"],
        :rdr => [
                "rdr on $ext_if proto tcp from any to any port 80 -> $web_servers round-robin sticky-address",
                "rdr on $ext_if proto tcp from any to any port 22 -> $bastion_server round-robin sticky-address"

        ],
        :filter => [
                "block in all",
                "block return",
                "pass out keep state",
                "antispoof log quick for lo0 inet",
                "antispoof on $ext_if",
                "antispoof on $int_if",

                "pass quick on lo0 all",

                # block inet6
                "block in quick inet6",

                # silently drop broadcasts cable modem noise
                "block in quick on $ext_if from any to 255.255.255.255",

                # block anything coming from source we have no back routes for
                "block in from no-route to any",

                # Block and log outgoing packets that don't have our address as source,
                # they are either spoofed or something is misconfigured NAT disabled,
                # (for instance), we want to be nice and don't send out garbage.
                "block out log quick on $ext_if from ! $ext_if to any",


                # pass in on external interface to any of the open_services (22, 80, 443)
                "pass in on $ext_if inet proto tcp from any to ($ext_if) port $open_services flags S/SA keep state",

                # pass out all TCP connections and modulate state
                "pass out on $ext_if proto tcp from ($ext_if) to any flags S/SA modulate state queue (q_def1,q_pri)",

                # pass out all UDP connections and keep state
                "pass out on $ext_if proto udp from ($ext_if) to any keep state queue (q_def1)",

                # pass out all ICMP connections and keep state
                "pass out on $ext_if inet proto icmp from ($ext_if) to any keep state",

                # Allow only specific block of trusted ip's to ssh to the firewall.
                "pass in quick on $ext_if inet proto tcp from { <trustedhostsstatic>,<trustedhostsdynamic> } to ($ext_if) port 22 flags S/SA keep state queue (q_def1,ssh_login)",


                # pass pfsync protocol on pfsync interface
                "pass on $sync_if proto pfsync",

                # pass carp protocol on internal,external interface

                "pass on $ext_if proto carp",
                "pass on $int_if proto carp"

        ],

        }