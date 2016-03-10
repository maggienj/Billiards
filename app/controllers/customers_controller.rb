class CustomersController < ApplicationController
def new
  @customer = Customer.new
end

def create
  @customer = Customer.new(customer_params)
  if @customer.save
#    redirect_to @customer, alert: "Customer created successfully"
redirect_to @customer  
else
render 'new'
end
end

 def show
  @customer = Customer.find(params[:id])
end

def index
 @customer = Customer.all
end

def edit
 @customer = Customer.find(params[:id])
end


def edit
 @customer = Customer.find(params[:id])
end

def update
   @customer = Customer.find(params[:id])
	
   if @customer.update_attributes(customer_params)
      redirect_to :action => 'show', :id => @customer
   else
      @customers = Customer.all
      render :action => 'edit'
   end
end




def delete
   Customer.find(params[:id]).destroy
   redirect_to :action => 'index'
end


def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy
  redirect_to :action => 'index'
end




private

def customer_params
 params.require(:customer).permit(:firstname, :lastname, :email, :city, :zip, :state)

end

end
