class ProductsController < ShopController
	def show
		@product = Product.find(params[:id])
	end

	def search
		@result = @search.result
		
		if params[:q][:name_cont].present? && params[:desc_search].present?
			params_desc = params[:q].clone
			params_desc[:desc_cont] = params_desc.delete(:name_cont)
			@result += Product.search(params_desc).result
		end
		@result.uniq!
	end
end