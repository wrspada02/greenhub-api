module FuncionarioHelpers
  def build_invalid_funcionario_params(overrides = {})
    { funcionario: attributes_for(:funcionario).merge(empresa_id: create(:empresa).id).merge(overrides) }
  end
end
