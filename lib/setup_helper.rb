require "mkmf"

# Used by bin/setup
module SetupHelper
  def set_mkmf_log(logfile = File::NULL)
    MakeMakefile::Logging.instance_variable_set(:@logfile, logfile)
  end

  # Return path to cmd as a String, or nil if not found.
  def which(cmd)
    old_mkmf_log = MakeMakefile::Logging.instance_variable_get(:@logfile)
    set_mkmf_log(nil)
    path_to_cmd = find_executable0(cmd)
    set_mkmf_log(old_mkmf_log)
    path_to_cmd
  end

  module_function :which, :set_mkmf_log
end
