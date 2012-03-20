require 'test_helper'

describe Phase do
  it 'should order by position' do
    last = create(:phase, position: 5)
    first = create(:phase, position: 2)

    Phase.all.first.must_equal first
    Phase.all.last.must_equal last
  end

  it 'should have position automagically' do
    I18n.locale = :es
    phase = create(:phase)
    phase.position.must_equal 1
    phase = create(:phase)
    phase.position.must_equal 2
  end

  it 'finds by trasnlated slug' do
    I18n.locale = :ca
    p = create(:phase, name: 'Un nom')

    I18n.locale = :es
    p.update_attributes(name: 'Un nombre')

    Phase.find('un-nombre').must_equal p
    I18n.locale = :ca
    Phase.find('un-nom').must_equal p
  end

  it 'have translated fields' do
    I18n.locale = :ca
    phase = create(:phase, name: 'Un nom')
    I18n.locale = :es
    phase.update_attributes(name: 'Un nombre')
    phase.name.must_equal 'Un nombre'
    I18n.locale = :ca
    phase.name.must_equal 'Un nom'
  end

  it 'should create versions' do
    Version.count.must_equal 0
    create(:phase, name: 'Some phase')
    Version.count.must_be :>, 0
  end


  # PROBLEMS
  it 'can have problems' do
    phase = create(:phase)
    problem = create(:problem, phase_id: phase.id)
    phase.problems.count.must_equal 1
    phase.problems.first.must_equal problem
  end
end
