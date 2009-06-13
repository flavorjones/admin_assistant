# backport Object#instance_exec from 1.9
#
# implementation from Mauricio Fernandez
# http://www.ruby-forum.com/topic/54096
#
class Object
  unless method_defined?(:instance_exec)
    def instance_exec(*args, &block)
      mname = "__instance_exec_#{Thread.current.object_id.abs}"
      class << self; self end.class_eval{ define_method(mname, &block) }
      begin
        ret = send(mname, *args)
      ensure
        class << self; self end.class_eval{ undef_method(mname) } rescue nil
      end
      ret
    end
  end
end
