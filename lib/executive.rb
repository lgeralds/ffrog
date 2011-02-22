# 
#  executive.rb
#  transcode
#  
#  Created by lgeralds on 2011-02-06.
#  Copyright 2011 lgeralds. All rights reserved.
# 

class ExecutionException < StandardError
end

module Executive
    def exe( command )
      # puts command
      r = ''
      IO.popen( "#{command} 2>&1" ) { |io|
        r = io.readlines
      }

      if $? && $?.exitstatus != 0
          raise ExecutionException, r.unshift( command + "\n" ).to_s
      end

      return r
    end
end
