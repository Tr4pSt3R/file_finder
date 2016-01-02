require 'find'
require 'fileutils'

module FileFinder
  def locate(path)
    Find.find(path) { |p| File.lstat(p).size == 0 }
  end
  module_function :locate
end


RSpec.describe FileFinder do
  describe '#locate_files' do
    context 'empty directory' do
      it 'finds nothing' do
        FileUtils::mkdir_p '~/tmp/empty'

        matched_files = FileFinder.locate '~/tmp/empty/'

        expect(matched_files).to eq nil
      end
    end
  end
end
