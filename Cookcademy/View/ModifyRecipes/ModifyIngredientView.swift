//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Michał Gerlach on 27/08/2022.
//

import SwiftUI



struct ModifyIngredientView: ModifyComponentView {
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @Binding var ingredient : Ingredient
    @Environment(\.presentationMode) private var mode
    @EnvironmentObject private var recipeData: RecipeData
    
    let createAction: ((Ingredient) -> Void)
    
    init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void) {
        self._ingredient = component
        self.createAction = createAction
    }
    
    
    var body: some View {
        Form {
            TextField("Ingredient Name", text: $ingredient.name)
                .listRowBackground(listBackgroundColor)
            Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                HStack{
                    Text("Quantity: ")
                    TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                        .keyboardType(.numbersAndPunctuation)
                }
            }.listRowBackground(listBackgroundColor)
            Picker(selection: $ingredient.unit, label:
                HStack {
                    Text("Unit")
                    Spacer()
                    Text(ingredient.unit.rawValue)
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) {
                        unit in Text(unit.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .listRowBackground(listBackgroundColor)
            
            HStack {
                Spacer()
                Button("Save") {
                    createAction(ingredient)
                    mode.wrappedValue.dismiss()
                }
                Spacer()
            }.listRowBackground(listBackgroundColor)
        }.foregroundColor(listTextColor)
        }
    }

extension NumberFormatter {
  static var decimal: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
    }
}
 

struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var emptyIngredient = Recipe.testRecipes[0].ingredients[0]
    static var previews: some View {
        NavigationView{
            ModifyIngredientView(component: $emptyIngredient) {ingredient in
                print(ingredient)
            }
        } .navigationTitle("Add Ingredient")
  }
}
