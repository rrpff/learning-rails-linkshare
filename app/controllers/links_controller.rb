require 'open-uri'

class LinksController < ApplicationController

    before_action :authenticate_user!,
        except: [:index, :show]

    def index
        @links = view_context.latest Link.all

        if user_signed_in?
            @link = current_user.links.new
        end
    end

    def show
        @link = Link.find params[:id]

        # Extract article from webpage
        @link_content = extract_content @link.url
    end

    def new
        @link = current_user.links.new
    end

    def edit
        @link = current_user.links.new
    end

    def create
        @link = current_user.links.new link_params

        if @link.save
            redirect_to @link
        end
    end

    def update
        @link = Link.find params[:id]

        if @link.user === current_user
            @link.update link_params
        end

        redirect_to @link
    end

    def destroy
        @link = Link.find params[:id]

        if @link.user === current_user
            @link.destroy
        end

        redirect_to links_path
    end

    private

        def link_params
            params.require(:link)
                .permit(:title, :url)
        end

        def extract_content(url)
            html = open(url).read
            extracted = Readability::Document.new html,
                tags: %w(div a p h1 h2 h3 h4 h5 h6 hr img pre code ul li ol blockquote em strong),
                attributes: %w(src href id),
                remove_empty_nodes: false

            extracted.content
        end

end