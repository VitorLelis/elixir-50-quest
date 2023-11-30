ExUnit.start()

defmodule Questions_test do
  use ExUnit.Case, async: true

  test "1 -> enum_from_to" do
    assert Questions.enum_from_to(1,5) == [1,2,3,4,5]
    assert Questions.enum_from_to(5,1) == [5,4,3,2,1]    
  end

  test "2 -> enum_from_then_to" do
    assert Questions.enum_from_then_to(1,3,10) == [1,3,5,7,9]
    assert Questions.enum_from_then_to(10,3,1) == [10,3]
  end

  test "3 -> concat" do
    assert Questions.concat([],[]) == []
    assert Questions.concat([1,2,3],[10,20,30]) == [1,2,3,10,20,30]
  end

  test "4 -> index" do
    assert Questions.index([10,20,30],1) == 20
    assert Questions.index([1,2,3],4) == nil
  end

  test "5 -> reverse" do
    assert Questions.reverse([1,2,3]) == [3,2,1]
  end

  test "6 -> take" do
    assert Questions.take([10,20,30], 2) == [10,20]
    assert Questions.take([10,20,30], 4) == [10,20,30] 
  end

  test "7 -> drop" do
    assert Questions.drop([10,20,30], 2) == [30]
    assert Questions.drop([10,20,30], 4) == [] 
  end

  test "8 -> zip" do
    assert Questions.zip([1,2,3],[10,20,30,40]) == [{1,10},{2,20},{3,30}]
  end

  test "9 -> replicate" do
    assert Questions.replicate(3,10) == [10,10,10]
  end

  test "10 -> intersperse" do
    assert Questions.intersperse([10,20,30],1) == [10,1,20,1,30]
    assert Questions.intersperse([10],1) == [10]
  end

  test "11 -> group" do
    assert Questions.group([1,2,2,3,4,4,4,5,4]) == [[1],[2,2],[3],[4,4,4],[5],[4]]
  end

  test "12 -> otherconcat" do
    assert Questions.otherconcat([[1],[2,2],[3],[4,4,4],[5],[4]]) == [1,2,2,3,4,4,4,5,4]
  end

  test "13 -> inits" do
    assert Questions.inits([11,21,13]) == [[],[11],[11,21],[11,21,13]]
  end

  test "14 -> tails" do
    assert Questions.tails([1,2,3]) == [[1,2,3],[2,3],[3],[]]
  end

  test "15 -> heads" do
    assert Questions.heads([[2,3,4],[1,7],[],[8,5,3]]) == [2,1,8]
  end

  test "16 -> total" do
    assert Questions.total([[2,3,4],[1,7],[],[8,5,3]]) == 8
  end

  test "17 -> fun" do
    assert Questions.fun([{"rui",3,2}, {"maria",5,2}, {"ana",43,7}]) == [{"rui",2}, {"maria",2}, {"ana",7}]
  end

  test "18 -> cola" do
    assert Questions.cola([{"rui",3,2}, {"maria",5,2}, {"ana",43,7}]) == "ruimariaana"
  end

  test "19 -> idade" do
    assert Questions.idade([{"rui",1995}, {"maria",2009}, {"ana",1947}], 2021, 26) == ["rui","ana"]
  end

  test "20 -> idade" do
    assert Questions.power_enum_from(2,4) == [1,2,4,8]
  end

  test "21 -> prime?" do
    assert Questions.prime?(2) == true
    assert Questions.prime?(7) == true
    assert Questions.prime?(9) == false
  end

  test "22 -> prefix_of?" do
    assert Questions.prefix_of?([10,20],[10,20,30]) == true
    assert Questions.prefix_of?([10,30],[10,20,30]) == false
  end

  test "23 -> suffix_of?" do
    assert Questions.suffix_of?([10,20],[10,20,30]) == false
    assert Questions.suffix_of?([20,30],[10,20,30]) == true
  end

  test "24 -> subsequence_of?" do
    assert Questions.subsequence_of?([20,40],[10,20,30,40]) == true
    assert Questions.subsequence_of?([40,20],[10,20,30,40]) == false
  end

  test "25 -> elem_indices" do
    assert Questions.elem_indices([1,2,3,4,3,2,3,4,5], 3) == [2,4,6]
  end

  test "26 -> nub" do
    assert Questions.nub([1,2,1,2,3,1,2]) == [1,2,3]
  end

  test "27 -> delete" do
    assert Questions.delete([1,2,1,2,3,1,2],2) == [1,1,2,3,1,2]
  end

  test "28 -> delete_list" do
    assert Questions.delete_list([1,2,3,4,5,1],[1,5]) == [2,3,4,1]
  end

  test "29 -> union" do
    assert Questions.union([1,1,2,3,4],[1,5]) == [1,1,2,3,4,5]
  end

  test "30 -> intersect" do
    assert Questions.intersect([1,1,2,3,4],[1,3,5]) == [1,1,3]
  end

  test "31 -> insert" do
    assert Questions.insert([1,20,30,40],25) == [1,20,25,30,40]
    assert Questions.insert([1,20,30,40],45) == [1,20,30,40,45]
  end

  test "32 -> unword" do
    assert Questions.unword(["Programacao", "Funcional"]) == "Programacao Funcional"
  end

  test "33 -> unlines" do
    assert Questions.unlines(["Prog", "Func"]) == "Prog\nFunc\n"
  end

  test "34 -> p_maior" do
    assert Questions.p_maior([1,2,5,4]) == 2
    assert Questions.p_maior([10,2,5,4]) == 0
  end

  test "35 -> lookup" do
    assert Questions.lookup([{"a",1},{"b",2},{"c",3}], "b") == 2
    assert Questions.lookup([{"a",1},{"b",2},{"c",3}], "d") == nil
  end

  test "36 -> pre_crescente" do
    assert Questions.pre_crescente([3,7,9,6,10,22]) == [3,7,9]
  end

  test "37 -> my_sort" do
    assert Questions.my_sort([3,7,9,6,10,22]) == [3,6,7,9,10,22]
  end

  test "38 -> menor" do
    assert Questions.menor('sai','saiu') == true
    assert Questions.menor('prog','funcional') == false
  end

  test "39 -> elem_set" do
    assert Questions.elem_set([{"a",1},{"b",2},{"c",3}], "b") == true
    assert Questions.elem_set([{"a",1},{"b",2},{"c",3}], "d") == false
  end

  test "40 -> convert_set" do
    assert Questions.convert_set([{"a",1},{"b",2},{"c",3}]) == "abbccc"
  end

  test "41 -> insert_set" do
    assert Questions.insert_set([{"a",1},{"b",2},{"c",3}],"b") == [{"a",1},{"b",3},{"c",3}]
    assert Questions.insert_set([{"a",1},{"b",2},{"c",3}],"d") == [{"a",1},{"b",2},{"c",3}, {"d", 1}] 
  end

  test "42 -> remove_set" do
    assert Questions.remove_set([{"a",1},{"b",2},{"c",3}],"b") == [{"a",1},{"c",3}]
    assert Questions.remove_set([{"a",1},{"b",2},{"c",3}],"d") == [{"a",1},{"b",2},{"c",3}]
  end

  test "43 -> constroi_set" do
    assert Questions.constroi_set('abbccc') == [{"a",1},{"b",2},{"c",3}]
  end

  test "44 -> partition" do
    assert Questions.partition([{"Left", 1},{"Right",2},{"Left", 3},{"Right",4}]) == {[1,3],[2,4]}
  end

  test "45 -> cat_maybes" do
    assert Questions.cat_maybes([{"Just", 2},"Nothing",{"Just", 3}]) == [2,3]
  end

  test "46 -> caminho" do
    assert Questions.caminho({0,0},{3,4}) == ["Este","Este","Este","Norte","Norte","Norte","Norte"]
    assert Questions.caminho({2,3},{0,0}) == ["Oeste","Oeste","Sul","Sul","Sul"]
  end

  test "47 -> has_loop" do
    assert Questions.has_loop?({0,0},["Norte", "Sul", "Este"]) == true
    assert Questions.has_loop?({0,0}, ["Norte", "Norte","Oeste"]) == false
    assert Questions.has_loop?({0,0}, ["Norte", "Norte","Sul","Oeste"]) == false
  end 

  test "48 -> conta_quadrados" do
    assert Questions.conta_quadrados([{{0,0},{1,1}},{{3,4},{4,9}}]) == 1
  end 

  test "49 -> area_total" do
    assert Questions.area_total([{{0,0},{1,1}},{{3,4},{4,9}}]) == 6
  end

  test "50 -> nao_reparar" do
    assert Questions.nao_reparar(["Avariado","Bom","Avariado","Razoavel"]) == 2
  end

end