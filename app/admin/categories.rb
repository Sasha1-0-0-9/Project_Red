ActiveAdmin.register Category do
  controller do
    def permitted_params
      params.permit category: [:title]
    end
  end
end
