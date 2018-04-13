require 'test_helper'

class RemunerationsControllerTest < ActionDispatch::IntegrationTest

  test "should create remuneration" do
    @remuneration = remunerations(:one)
      post worker_remunerations_url(workers(:one), params: {
         remuneration: {
          absence: @remuneration.absence, advance_payment: @remuneration.advance_payment,
          advance_payment_discount: @remuneration.advance_payment_discount, base_salary: @remuneration.base_salary,
          bonus: @remuneration.bonus, business_name: @remuneration.business_name, extra_hour: @remuneration.extra_hour,
          family_burden: @remuneration.family_burden, food_allowance: @remuneration.food_allowance,
          health_discount: @remuneration.health_discount, health_plan_deduction: @remuneration.health_plan_deduction,
          health_plan_name: @remuneration.health_plan_name, month: @remuneration.month, net_pay: @remuneration.net_pay,
          non_tax_base: @remuneration.non_tax_base, pension_fund_deduction: @remuneration.pension_fund_deduction,
          pension_fund_discount: @remuneration.pension_fund_discount, pension_fund_name: @remuneration.pension_fund_name,
          tax_base: @remuneration.tax_base, taxable: @remuneration.taxable, taxpayer_id_company: @remuneration.taxpayer_id_company,
          total_asset: @remuneration.total_asset, total_discount: @remuneration.total_discount,
          total_legal_discount: @remuneration.total_legal_discount, total_other_discount: @remuneration.total_other_discount,
          transportation_allowance: @remuneration.transportation_allowance, unemployment_insurance: @remuneration.unemployment_insurance,
          unique_tax_discount: @remuneration.unique_tax_discount, worker_id: @remuneration.worker_id,
          worker_name: @remuneration.worker_name, worker_rut: @remuneration.worker_rut } })

    assert_redirected_to worker_remuneration_url(workers(:one),Remuneration.last)
    assert_equal 1904000, Remuneration.last.taxable
  end

end
