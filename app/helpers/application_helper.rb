module ApplicationHelper

    def latest(query, limit=25)
        query.order(created_at: :desc)
            .limit(limit)
    end

end
