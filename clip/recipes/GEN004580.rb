## (GEN004580: CAT I) (Previously - G647) The SA will ensure .forward files
## are not used.
execute "no_forwards" do
  command "/bin/bash -c for HOMEDIR in `cut -d: -f6 /etc/passwd`; do rm -f \$HOMEDIR/.forward; done"
end

