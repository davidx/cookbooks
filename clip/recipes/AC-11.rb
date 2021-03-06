# AC-11: Session Lock
# Kickstart Actions:

# AC-11(1)
# Kickstart Actions:

  ## (GEN000500: CAT II) (Previously - G605) The SA will configure systems to log
  ## out interactive processes (i.e., terminal sessions, ssh sessions, etc.,)
  ## after 15 minutes of inactivity or ensure a password protected screen lock
  ## mechanism is used and is set to lock the screen after 15 minutes of
  ## inactivity.

edit_file "/etc/profile/timeout" do
  append_if_no_such_line "readonly TMOUT=900"
end


