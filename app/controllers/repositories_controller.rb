class RepositoriesController < ApplicationController
  def index
    github = GithubService.new
    github.access_token = session[:token]
    github.username = session[:username]
    @repos_array = github.get_repos
  end

  def create
    github = GithubService.new
    github.access_token = session[:token]
    github.username = session[:username]
    github.create_repo(params[:name])
    redirect_to '/'
  end
end
