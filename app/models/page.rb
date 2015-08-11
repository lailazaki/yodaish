class Page < ActiveRecord::Base

  def self.yoda(quote)
	  quote ||= "Lets Speak Some Yoda" 
	  response = Unirest.get "https://yoda.p.mashape.com/yoda?sentence=#{quote}",
	  headers:{
	    "X-Mashape-Key" => "NXIUTuZbdJmshg4KRBuTBn6KrkHap1ST6A0jsnXXyIwC3ochox",
	    "Accept" => "text/plain"
	  }
  end
  
end    


