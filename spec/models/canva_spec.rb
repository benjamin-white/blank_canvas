require "rails_helper"

describe Canva, type: :model do

  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif', 'image/jpeg').
                rejecting('text/plain', 'text/xml') }



  it 'is not valid without a photo' do
    canva = Canva.new
    expect(canva).to have(1).error_on(:image)
    expect(canva).not_to be_valid
  end
end
