module Nesta
  class App < Sinatra::Base
    get '/css/:sheet.css' do
      content_type 'text/css', :charset => 'utf-8'
      cache stylesheet(params[:sheet].to_sym)
    end

    get %r{/attachments/([\w/.-]+)} do |file|
      file = File.join(Nesta::Config.attachment_path, params[:captures].first)
      if file =~ /\.\.\//
        not_found
      else 
        send_file(file, :disposition => nil)
      end
    end

    get '/articles.xml' do
      content_type :xml, :charset => 'utf-8'
      set_from_config(:title, :subtitle, :author)
      @articles = Page.find_articles.select { |a| a.date }[0..9]
      cache haml(:atom, :format => :xhtml, :layout => false)
    end

    get '/sitemap.xml' do
      content_type :xml, :charset => 'utf-8'
      @pages = Page.find_all
      @last = @pages.map { |page| page.last_modified }.inject do |latest, page|
        (page > latest) ? page : latest
      end
      cache haml(:sitemap, :format => :xhtml, :layout => false)
    end

    get '*' do
      set_common_variables
      parts = params[:splat].map { |p| p.sub(/\/$/, '') }
      @page = Nesta::Page.find_by_path(File.join(parts))
      raise Sinatra::NotFound if @page.nil?
      @title = @page.title
      set_from_page(:description, :keywords)
      cache erb(@page.template, :layout => @page.layout)
    end
  end
end
