class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_session_path, notice: 'Пользователь успешно зарегистрирован.'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации'
      render :new
    end
  end
  def index
    @user= User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'Аккаунт успешно удален.'
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path, notice: 'Данные пользователя обновлены.'
    else
      flash.now[:alert] = 'При попытке обновить данные возникли ошибки'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name, :email, :login, :password, :password_confirmation
    )
  end

end
