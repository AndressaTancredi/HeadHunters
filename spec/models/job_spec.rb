require 'rails_helper'

RSpec.describe Job, type: :model do
  context 'validation' do
    it 'title cannot be blank' do
      job = Job.new

      job.valid?

      expect(job.errors[:title]).to include('não pode ficar em branco')
    end
  end
end
