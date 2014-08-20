class Contact	
  def initialize(id=nil,first_name=nil, last_name=nil, email=nil, note=nil)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

attr_accessor(:id, :first_name, :last_name, :email, :note)

end