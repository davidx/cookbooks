## (GEN003860: CAT III) (Previously - V046) The SA will ensure finger is not
## enabled.
service "finger" do
  action [:disable, :stop]
end
