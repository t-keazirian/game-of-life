require 'rspec'
require_relative '../lib/life.rb'

describe 'hello_world' do
  it 'prints a hello message' do
    expect(GameOfLife.hello_world).to eq("Hello, World!")
  end
end
