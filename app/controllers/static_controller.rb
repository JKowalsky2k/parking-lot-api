class StaticController < ApplicationController
    before_action :require_token, only: [:summary]
    def index
    end

    def summary
    end
end
