When /I click on the image "(.*)"/ do |image|
    
    find("#{image}").click
end