from rocrate.rocrate import ROCrate
from rocrate.model.person import Person

crate = ROCrate()

readme = crate.add_file("./README.md", properties = {
    "name": "readme",
    "encodingFormat": "text/markdown",
})

scenario1 = crate.add_dataset("./scenario1", properties = {
    "name": "scenario1",
    "description": "Analyze representation of CWL metadata fields and human agent"
})

scenario2 = crate.add_dataset("./scenario2", properties = {
    "name": "scenario2",
    "description": "Analyze representation of SoftwareRequirement",
})

scenario3 = crate.add_dataset("./scenario3", properties = {
    "name": "scenario3",
    "description": "Analyze representation of DockerRequirement",
})

scenario4 = crate.add_dataset("./scenario4", properties = {
    "name": "scenario4",
    "description": "Analyze representation of input parameter values and ResourceRequirement",
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