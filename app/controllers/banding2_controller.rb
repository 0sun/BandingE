class Banding2Controller < ApplicationController
    def main_search
        require 'open-uri'
        
        @search_text = CGI.escape(params[:search_text])
        #uri = URI("http://www.akbobada.com/searchAll.html?searchKeyword="+@search_text+"&searchFlag=1&searchSecod=&artistOrderBy=0")
        uri = URI("http://www.akbobada.com/searchAll.html?searchKeyword="+@search_text+"&searchFlag=0&searchSecod=&artistOrderBy=0")

        html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
        #div.mscore_lst//table.score_lst//score_lst//
        
        @title_result = html_doc.css("div#akbo1.mscore_lst//table.score_lst//td.music").inner_text.split("악보")
        #@title_result = @html_doc.css("tbody//td").inner_text
        
        @singer_result = html_doc.css("div#akbo1.mscore_lst//table.score_lst//td.artist").inner_text.split("악보")
        #@singer_result = @html_doc.css("div#list//table.score_lst#partitionTable//tbody#akbolist//td.artist").inner_text.split("악보")
        
        @album_result = html_doc.css("div#akbo1.mscore_lst//table.score_lst//td.album").map { |album| album.text }
        #@album_result = @html_doc.css("div#list//table.score_lst#partitionTable//tbody#akbolist//td.album").map { |album| album.text }
        
        @url_result = html_doc.css("div#akbo1.mscore_lst//table.score_lst//td.music//a").map { |link| link['href'] }
        #@url_result = @html_doc.css("div#list//table.score_lst#partitionTable//tbody#akbolist//td.music//a").map { |link| link['href'] }
        
        
        #i=0
        #while i < @title_text.length
        #    uri = URI(@url_result[i])
        #    html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
        #    @img_result[i] = html_doc.css('div.thmb//img').attr('src')
        #    i+=1
        #end
        
    end
end
