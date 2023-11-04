from rocrate.rocrate import ROCrate
from rocrate.model.person import Person

crate = ROCrate()

readme = crate.add_file("./README.md", properties = {
    "name": "readme",
    "encodingFormat": "text/markdown",
})

scenario1 = crate.add_dataset("./scenario1", properties = {
    "name": "scenario1",
})

scenario2_a = crate.add_dataset("./scenario2_a", properties = {
    "name": "scenario2_a",
})

scenario2_b = crate.add_dataset("./scenario2_b", properties = {
    "name": "scenario2_b",
})

scenario3 = crate.add_dataset("./scenario3", properties = {
    "name": "scenario3",
})

scenario4_a = crate.add_dataset("./scenario4_a", properties = {
    "name": "scenario4_a",
})

scenario4_b = crate.add_dataset("./scenario4_b", properties = {
    "name": "scenario4_b",
})

renske_id = "https://orcid.org/0000-0003-0902-0086"
michael_id = "https://orcid.org/0000-0002-2961-9670"

renske = crate.add(Person(crate, renske_id, properties = {
    "name": "Renske de Wit", 
}))

michael = crate.add(Person(crate, michael_id, properties = {
    "name": "Michael R. Crusoe", 
}))

readme["author"] = [renske, michael]

crate.write("./analysis_rocrate")