## (GEN001080: CAT III) (Previously - G229) The SA will ensure the root shell
## is not located in /usr if /usr is partitioned.
user "root" do
  shell "/bin/bash"
end
