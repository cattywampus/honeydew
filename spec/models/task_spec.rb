require 'spec_helper'
require 'rails_helper'

describe Task do
  it { should belong_to :list }
  it { should validate_presence_of :title }
end
