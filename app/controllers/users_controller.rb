class UsersController < ApplicationController

  def new
    # instanciamos o model user para usa-lo na variavel @user
      @user = User.new
  end

  def create
    # vamos chamar nossa model user e verificar e os compos no
    # formulario foram passados corretamente

    @user = User.new(user_params)
    if @user.save
        flash[:success] = 'Usuario cadastrado com sucesso :)'
        redirect_to root_url
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :nome, :password, :password_confirmation)
    end
end
