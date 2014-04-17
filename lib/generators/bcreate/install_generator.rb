module Bcreate
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Update Configuration"
      def install
        #cfg_application
        cfg_route
        cfg_db
      end
      private
      def cfg_route
        file='config/routes.rb'
        str="\n  root 'patients#index'"
        ptn="draw do"        
        inject_into_file file,str,:after => ptn
        #Application < Rails::Application
      end
      def cfg_application
        file='config/application.rb'
        str  ="\nconfig.generators.stylesheets = false"
        str +="\nconfig.generators.javascripts = false"        
        str +="\nconfig.generators.helper = false"    
        ptn="class Application < Rails::Application" 
        inject_into_file file,str,:after => ptn
      end 
      def cfg_db()
        fname='config/database.yml'
        dbname='prd_db'
        dbuser='root' 
        dbpwd='dbroot'
        data=YAML.load_file(fname)
        return unless data
        data['development']['username']=dbuser
        data['production']['username']=dbuser 
        data['development']['password']=dbpwd
        data['production']['password']=dbpwd
        File.open(fname,'w'){|f| f.write(data.to_yaml)}
      end           
    end
  end
end