//
//  SwiftUIView.swift
//  
//
//  Created by devdchaudhary on 11/07/23.
//

import SwiftUI

public struct CountryPicker: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedCode: String
    
    @State var isSearched = false
    @State var searchQuery = ""
    
    @State var countries = NSLocale.isoCountryCodes
    
    public init(selectedCode: Binding<String>, isSearched: Bool = false, searchQuery: String = "", countries: [String] = NSLocale.isoCountryCodes) {
        self._selectedCode = selectedCode
        self.isSearched = isSearched
        self.searchQuery = searchQuery
        self.countries = countries
    }
    
    public var body: some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                
                HStack {
                    
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search a Country", text: $searchQuery)
                        .submitLabel(.search)
                        .onSubmit {
                            withAnimation {
                                searchClicked()
                            }
                        }
                        .onChange(of: searchQuery) { val in
                            
                            searchQuery = val.capitalizedSentence.trimmingCharacters(in: .whitespacesAndNewlines)
                            
                            if val.isEmpty {
                                
                                isSearched = false
                                countries = NSLocale.isoCountryCodes
                                
                            } else {
                                
                                isSearched = true
                                
                                countries = NSLocale.isoCountryCodes
                                countries = countries.filter({ Locale.current.localizedString(forRegionCode: $0.description)?.contains(searchQuery) ?? false})

                            }
                        }
                    
                    Spacer()
                    
                    if isSearched {
                        
                        Button {
                            
                            withAnimation {
                                cancelSearch()
                            }
                            
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.primaryText)
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                .background(Color(uiColor: .systemGray5))
                .cornerRadius(30)
                
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondaryText)
            
            List {
                
                ForEach(countries, id: \.self) { countryCode in
                    Button {
                        optionClicked(countryCode: countryCode)
                    } label: {
                        HStack {
                            Text(countryCode.getFlag)
                            Text(Locale.current.localizedString(forRegionCode: countryCode) ?? "")
                            Spacer()
                            Text("+\(Constants.countryDictionary[countryCode] ?? "")")
                                .foregroundColor(.primaryText)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .listStyle(.inset)
        }
    }
    
    func cancelSearch() {
        isSearched = false
        searchQuery = ""
        countries = NSLocale.isoCountryCodes
    }
    
    func searchClicked() {
        countries = NSLocale.isoCountryCodes
        countries = countries.filter({ Locale.current.localizedString(forRegionCode: $0.description) == searchQuery})
    }
    
    func optionClicked(countryCode: String) {
        selectedCode = Constants.countryDictionary[countryCode] ?? ""
        dismiss()
    }
}
