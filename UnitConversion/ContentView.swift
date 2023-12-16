//
//  ContentView.swift
//  UnitConversion
//
//  Created by Santiago Gonzalez on 15/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var valueToConvert: Double = 0.0
    @State private var typeOfConvertion: Int = 0
    @State private var typeOfResult: Int = 0
    
    private var units = ["seconds","minutes","hours", "days"]
    private var valores = [0: 1, 1: 60, 2: 3600, 3: 86400]
    var result: Double{
        var retorno: Double = 0.0
        var valorASegundos: Double = 0.0
        if(typeOfConvertion != 0){
            valorASegundos = Double(valueToConvert/Double(valores[typeOfConvertion] ?? 0))
        }
        if(typeOfConvertion == typeOfResult){
            retorno = valueToConvert
        }
        else if (typeOfConvertion < typeOfResult){
            valorASegundos = valueToConvert
            retorno = valorASegundos / Double(valores[typeOfResult] ?? 0)
        }
        else{
            retorno = valorASegundos * Double(valores[typeOfResult] ?? 0)
        }
        
        
        return retorno
    }

    
    var body: some View {
        NavigationStack {
            
            Form{
                
                
                Section("Ingrese valor"){
                    TextField("Hello, world!",value: $valueToConvert, format: .number)
                }
                Section{
                    Picker("Tipo de conversión", selection: $typeOfConvertion) {
                        ForEach(0..<units.count, id: \.self) {
                            Text(units[$0])
                        }
                    }
                }
               Section{
                    Picker("A que quieres convertir", selection: $typeOfResult) {
                        ForEach(0..<units.count, id: \.self) {
                            Text(units[$0])
                        }
                    }
                }
                
                
                Section("Resultado de la conversión"){
                    Text(result, format: .number)
                }
                
            }
            .navigationTitle("Conversor de tiempo")
            
            
        }
    }
}

#Preview {
    ContentView()
}
