# frozen_string_literal: true

module Admin
  class BulletinsController < Web::ApplicationController
    before_action :set_bulletin, only: %i[publish reject archive]
    after_action :verify_authorized, only: %i[publish reject archive]

    def index
      @q = Bulletin.order(created_at: :desc).ransack(params[:q])

      @bulletins = @q.result.page(params[:page])
    end

    def on_moderation
      @q = Bulletin.order(created_at: :desc).ransack(params[:q])

      @bulletins = @q.result.page(params[:page])
    end
    # render 'web/admin/bulletins/index'

    def publish
      authorize @bulletin
      if @bulletin.may_publish?
        @bulletin.publish!
        redirect_back fallback_location: admin_bulletins_path, notice: t('.success')
      else
        redirect_back fallback_location: admin_bulletins_path, notice: t('.error')
      end
    end

    def reject
      authorize @bulletin
      if @bulletin.may_reject?
        @bulletin.reject!
        redirect_back fallback_location: admin_bulletins_path, notice: t('.success')
      else
        redirect_back fallback_location: admin_bulletins_path, notice: t('.error')
      end
    end

    def archive
      authorize @bulletin
      if @bulletin.may_archive?
        @bulletin.archive!
        redirect_back fallback_location: admin_bulletins_path, notice: t('.success')
      else
        redirect_back fallback_location: admin_bulletins_path, notice: t('.error')
      end
    end

    private

    def set_bulletin
      @bulletin = Bulletin.find params[:id]
    end
  end
end
