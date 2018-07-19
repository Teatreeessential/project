class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
    helper_method :search_user_skill
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
  
  #모든 유저 리스트
  def list
    
    @users = User.all
     unless params[:skill].nil? and params[:category].nil?
      skills = params[:skill].split(",")  
      categories = params[:category].split(",")
      skill_users = Skill.where(skill_contents: skills).collect {|skill| skill.users}.flatten
      category_users = Category.where(category_contents: categories).collect {|cate| cate.users}.flatten
      @users = skill_users.concat(category_users).uniq 
      p @users
    end
  end
  
  #파트너 리스트에서 카테고리 

     
  

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  
  def repos
    response=RestClient.get('https://api.github.com/users/Teatreeessential/repos',
                             headers={Authorization:''});
    
    JSON.parse(response).each do |response| 
       languages = RestClient.get(response['languages_url'],
                              headers={Authorization:''});
       puts languages
    end
  end
  
  def search
    respond_to do |format|
      if params[:tech].strip.empty?
        format.js {render 'empty'} 
      else
        @skills = Skill.where("skill_contents Like ?","#{params[:tech]}%")
        format.js {render 'search_skill'}
      end
    end
  end
  
 def find_partner
  
    ##받아온 파라미터의 형식은 배열
    ##스킬 검색하고 프로필 리스트
    skills=params[:find_skill]
    categories = params[:find_category]
    @users = []
    @dummy_users = []
    
    if !skills.nil?&&!categories.nil? ##스킬 카테고리 모두 
      skills.each do |skill|
        skill_users = Skill.find_by(skill_contents: skill).users
          skill_users.each do |skill_user|
            if @dummy_users.include?(skill_user)
            else 
               @dummy_users.push(skill_user);
            end
          end
      end
      @dummy_users.each do |user|
          categories.each do |category|
            if user.categories.include?(Category.find(category))
                @users.push(user)
                break
            end
          end
      end
      @users
    elsif !skills.nil? #스킬만 검색
        skills.each do |skill|
          skill_users = Skill.find_by(skill_contents: skill).users
            skill_users.each do |skill_user|
              if @users.include?(skill_user)
              else 
                 @users.push(skill_user);
              end
            end
        end
        @users
    else
      User.all.each do |user| #카테고리만 검색
        categories.each do |category|
            if user.categories.include?(category)
                @users.push(user)
                break
            end
        end
      end
      @users
    end
 end
  
  
    
    
   
    
 
  
  
  
  def register
    ##향후 user_id는 current_user.id로 교체
    skills = params[:skill].split(",")   ##받아 온 스킬들을 저장
    categories = params[:category].split(",") ##받아 온 카테고리들을 저장
    introduce = params[:introduce] ##받아 온 자기소개를 저장
    tel = params[:tel] ##받아 온 전화번호를 저장
    file_path = params[:file_path] ##회원 이미지 저장
    if !User.find(5).user_contents.nil?
       SkillUser.where(user_id:5).destroy_all
       UserCategory.where(user_id:5).destroy_all
       User.update(user_contents:introduce,tel:tel,user_image:file_path)
    else
       User.create(user_contents:introduce,tel:tel,user_image:file_path) 
    end 
     
     skills.each do |skill|
       skill_id=Skill.find_by(skill_contents:skill).id
       SkillUser.create(user_id:5,skill_id:skill_id)
     end
     categories.each do |category|
        UserCategory.create(user_id:5,category_id:Integer(category))
     end
     ##받아 온 자기소개를 저장
     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
    
end
