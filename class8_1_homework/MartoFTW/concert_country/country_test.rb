is_ok = false


    Dir.glob(ARGV[0]).each do |file|
    
        `mkdir test_execution`
        `cp #{file} test_execution`
        `cp country_expected.csv test_execution`
        `cp stadion.csv test_execution`
        
        Dir.chdir "test_execution"
        
        `ruby #{file} stadion.csv BuLgArIa`
        result = system "diff country_result.csv country_expected.csv"
        
        if result
            result1 = `diff country_result.csv country_expected.csv`
            is_ok = true if result1 == ""
        end   
        
        `clear`
        puts is_ok
        
        Dir.chdir ".."        
        `rm -rf test_execution`
            
    end

    
