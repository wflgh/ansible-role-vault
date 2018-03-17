require '/tmp/kitchen/spec/spec_helper.rb'

describe 'vault' do

  describe 'prereqs are installed' do

    describe package('unzip') do

      it "is installed" do
        expect(subject).to be_installed
      end
    end
  end

  describe 'user exists' do

    describe user('vault') do

        it "exists" do
          expect(subject).to exist
        end

        it "belongs to the correct group" do
            expect(subject).to belong_to_group('vault')
        end
    end
  end

  describe 'is installed' do

    describe file('/usr/local/bin/vault') do

      it "is a directory" do
        expect(subject).to be_file
      end

      it "is owned by vault" do
        expect(subject).to be_owned_by 'vault'
      end

      it "is grouped in to vault" do
        expect(subject).to be_grouped_into 'vault'
      end

      it "is mode 755" do
        expect(subject).to be_mode 755
      end
    end

    describe file('/etc/vault/vault.hcl') do

      it "is a file" do
        expect(subject).to be_file
      end

      it "is owned by vault" do
        expect(subject).to be_owned_by 'vault'
      end

      it "is grouped in to vault" do
        expect(subject).to be_grouped_into 'vault'
      end

      it "is mode 400" do
        expect(subject).to be_mode 400
      end
    end

    describe service('vault') do

      it "is enabled" do
        expect(subject).to be_enabled
      end
    end

    describe service('vault') do
      it "is running" do
        expect(subject).to be_running
      end
    end
  end
end
