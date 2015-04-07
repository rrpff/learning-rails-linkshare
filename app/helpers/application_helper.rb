module ApplicationHelper

    def latest(query, limit=25)
        query.order(created_at: :desc)
            .limit(limit)
    end

    def page_header(title, subtitle=nil)
        content_for :title, title
        small = subtitle ? " <small>#{subtitle}</small>" : ""

        "<div class='page-header'><h1>#{title + small}</h1></div>"
    end

end
