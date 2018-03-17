require '/tmp/kitchen/spec/spec_helper.rb'

describe 'prereqs' do

  describe 'are installed' do

    describe package('unzip') do

      it "is installed" do
        expect(subject).to be_installed
      end
    end
  end
end