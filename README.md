# UniqueIndex
By Alex
this lib is for coredata in ios.

step1:
add a ENTITLES named 'Unique' in your xcdatamodeld file;

step2:
add Attribute 'index' as Integer16 and 'table' as String into 'Unique' ENTITLES;

step3:
export the Subclass to the project;

step4:
use '[UniqueIndex buildIndex:@"YourTabelName" startIndex:0 context:self.managedObjectContext];' for build the index once;

step5:
use '[UniqueIndex getIndex:@"YourTabelName" context:managedObjectContext]' where you need.
