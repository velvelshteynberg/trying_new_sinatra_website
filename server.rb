require 'sinatra'

all_family_members = [{First_name: "Velvel", Last_name: "Shteynberg"}, {First_name: "Devorah", Last_name: "Shteynberg"}]

get '/DisplayFamilyMembers' do 
    @all_family_members = all_family_members
    erb :DisplayAllFamilyMember
end 

get '/DevelopersName' do 
    "<h1> Hey, my name is Velvel Shteynberg </h1>"
end 

get '/NewFamilyMemberForm' do 
     erb :AddNewFamilyMember
end 

post '/AddingNewFamilyMember' do 
    new_family_member = {}
    new_family_member[:First_name] = params[:First_name]
    new_family_member[:Last_name] = params[:Last_name]
    all_family_members << new_family_member
    redirect to('/DisplayFamilyMembers')
end 

get '/DeleteFamilyMember' do 
    all_family_members.delete_at(params["id"].to_i)
    redirect to("/DisplayFamilyMembers")
end 

get '/updatefamilymemberform' do
    @first_name = params[:First_name]
    @last_name = params[:Last_name]
    erb :UpdateFamilyMemberForm
end 
