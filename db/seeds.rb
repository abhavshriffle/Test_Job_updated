line1 = Line.find_or_create_by(name: 'LineA', status: 'available')
line2 = Line.find_or_create_by(name: 'LineB', status: 'available')
line3 = Line.find_or_create_by(name: 'LineC', status: 'available')
line4 = Line.find_or_create_by(name: 'LineD', status: 'available')

train_operator1 = TrainOperator.find_or_create_by(name: 'Operator1')
train_operator2 = TrainOperator.find_or_create_by(name: 'Operator2')

parcel_owner1 = ParcelOwner.find_or_create_by(name: 'Owner1')
parcel_owner2 = ParcelOwner.find_or_create_by(name: 'Owner2')


parcel1 = Parcel.find_or_create_by(parcel_owner_id: parcel_owner1.id, weight: 1, volume: 20)
parcel2 = Parcel.find_or_create_by(parcel_owner_id: parcel_owner2.id, weight: 0.5, volume: 5)

offer1 = Offer.find_or_create_by(train_operator: train_operator1, price: 200, line: line1)
offer2 = Offer.find_or_create_by(train_operator: train_operator2, price: 150, line: line2)
offer3 = Offer.find_or_create_by(train_operator: train_operator1, price: 300, line: line3)
offer4 = Offer.find_or_create_by(train_operator: train_operator2, price: 250, line: line3)


puts 'Seed data created successfully.'
