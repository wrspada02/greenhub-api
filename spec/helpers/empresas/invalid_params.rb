module EmpresaHelpers
  def build_invalid_empresa_params(overrides = {})
    { empresa: attributes_for(:empresa).merge(overrides) }
  end
end
