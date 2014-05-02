#ifndef RESOURCE_MANGER_H
#define RESOURCE_MANGER_H


#include <Modeling/Resources.h>

using namespace std;

class ResourceTracker;

typedef SmartPointer<ResourceTracker> ResourceNode;

class ResourceTracker
{

 public:
  ResourcePtr resource;
  vector<ResourceNode> children;
  bool dirty;
  bool expanded;
  ResourceNode parent;

  ResourceTracker(ResourcePtr,ResourceNode parent=NULL);
  ResourceNode AddChild(ResourcePtr);
  vector<ResourceNode> AddChildren(vector<ResourcePtr>);
  void SetDirty();
  const char *Type(){return resource->Type();}
  const char *Name(){return resource->name.c_str();}
};



class ResourceManager
{
  
 public:
//  GenericBackendBase* backend;
  ResourceLibrary library;
  vector<ResourceNode> toplevel;
  ResourceNode selected;
  ResourceNode open;
  map<string,ResourceNode> itemsByName;

  ResourceManager();
  ResourceNode LoadResource(const string& fn);

  bool DeleteNode(ResourceNode r);
  bool DeleteSelected();
  bool ChangeSelected(ResourceNode);
  bool ChangeSelectedName(string name);
  int size();
  bool SaveSelected(const string& file="");

  vector<ResourceNode> ExtractSelectedChildren(vector<string> types);
  vector<ResourceNode> ExpandSelected();
  bool AddAsChild(ResourcePtr r);
};

#endif
