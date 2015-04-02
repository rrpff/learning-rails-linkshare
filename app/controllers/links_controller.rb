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

end
