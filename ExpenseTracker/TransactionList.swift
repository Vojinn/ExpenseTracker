//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Dusan Vojinovic on 1.3.23..
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TrasactionListViewModel
    
    var body: some View {
        VStack {
            List {
                //MARK: - Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month, transactions in
                    Section {
                        //MARK: - Transaction List
                        ForEach(transactions) { transaction in
                            
                            TransactionRow(transaction: transaction)
                                .overlay(
                                    NavigationLink("", destination: {
                                        TransactionView(transaction: transaction)
                                    })
                                    .opacity(0)
                                )
//                            ZStack {
//                                TransactionRow(transaction: transaction)
//                                NavigationLink("", destination: {
//                                    TransactionView(transaction: transaction)
//                                })
//                                .opacity(0)
//                            }
                        }
                    } header: {
                        //MARK: - Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TrasactionListViewModel = {
        let transactionListVM = TrasactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
