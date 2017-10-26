class CouncilQueuesController < ApplicationController
  before_action :set_council_queue, only: [:show, :edit, :update, :destroy]
  
  # GET /council_queues
  # GET /council_queues.json
  def index
    # get the queue data from the database
    @council_queues = CouncilQueue.getQueue

    @type = params[:userType]

    # check which type of user and then create a user depending on this

    if (@type == "Citizen")
      createCitizen(params[:title], params[:firstname], params[:lastname], params[:service], params[:userType])
    elsif (@type == "Organization") 
      createOrg(params[:org_name], params[:service], params[:userType])
    elsif (@type == "Anonymous") 
      createAnon(params[:service], params[:userType])
    end

    

  end


  private

    def createAnon(service, userType)
      @newAnon = AnonymousVisitor.new()
      @newAnon.service = service;
      @newAnon.visitor_type = userType;
      @newAnon.save!
     
      redirect_to("/")
    end

    def createOrg(orgName, service, userType) 
      @newOrg = Organization.new()
      @newOrg.name = orgName;
      @newOrg.service = service;
      @newOrg.visitor_type = userType;
      @newOrg.save!

      redirect_to("/")
    end

    def createCitizen(title, firstname, lastname, service, userType)
      @newCitizen = Citizen.new()
      @newCitizen.title = title
      @newCitizen.firstname = firstname
      @newCitizen.lastname = lastname
      @newCitizen.service = service;
      @newCitizen.visitor_type = userType;
      @newCitizen.save!
    
      redirect_to("/")
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_council_queue
      @council_queue = CouncilQueue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def council_queue_params
      params.require(:council_queue).permit(:type, :name, :service, :queued_at)
    end
end
