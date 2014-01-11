require 'spec_helper'

describe 'the logic grammar' do

  def can_parse(string)
    expect{
      Russell.parse(string)
    }.not_to raise_error
  end

  it 'parses sentences' do
    can_parse('B')
  end

  it 'parses disjunctions' do
    can_parse('A v B')
  end

  it 'parses complex disjunctions' do
    can_parse('(A v B) v C')
  end

  it 'parses really complex disjunctions' do
    can_parse('(A v B) v ((C v D) v E)')
  end

  it 'parses conjunctions' do
    can_parse('A ^ B')
  end

  it 'parses implications' do
    can_parse('A -> B')
  end

  it 'parses biconditionals' do
    can_parse('A <-> B')
  end

  it 'parses negated sentences' do
    can_parse('~A')
  end

  it 'parses negated connectives' do
    can_parse('~(A ^ B)')
  end

  it 'parses all connectives' do
    can_parse('((A ^ B) v C) <-> (A -> C)')
  end

end
