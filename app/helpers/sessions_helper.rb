module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    return unless (user_id = session[:user_id])
    @current_user ||= User.find_by id: user_id
  end

  def current_user? user
    user == current_user
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def options_for_tutor
    ["Lớp 10", "Lớp 11", "Lớp 12", "Sinh viên", "Giáo viên", "Giảng viên"]
  end

  def options_for_student
    ["Lớp 1", "Lớp 2", "Lớp 3", "Lớp 4", "Lớp 5", "Lớp 6",
      "Lớp 7", "Lớp 8", "Lớp 9", "Lớp 10", "Lớp 11", "Lớp 12"]
  end

  def select_subject
    Subject.all.map{|s| [s.name, s.id]}
  end

  def select_brand
    Post.all.map{|s| [s.brand, s.brand]}.uniq
  end

  def select_address_tutor
    Tutor.all.map{|s| [s.address, s.address]}.uniq
  end

  def select_address_student
    Student.all.map{|s| [s.address, s.address]}.uniq
  end

  def select_rating
    [
      ["1 sao","1"],
      ["2 sao","2"],
      ["3 sao","3"],
      ["4 sao","4"],
      ["5 sao","5"]
    ]
  end

  def options_for_day
    ["Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7", "Chủ nhật"]
  end

  def total_rate score, tutor
    tutor.reviews.where(score: score).count
  end
end
