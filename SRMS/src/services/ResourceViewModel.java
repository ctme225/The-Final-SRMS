package services;

import model.FeatureModel;
import model.ResourceModel;

import java.util.List;

public class ResourceViewModel {
    public ResourceModel getResource() {
        return resource;
    }

    public void setResource(ResourceModel resource) {
        this.resource = resource;
    }

    public List<FeatureViewModel> getFeatures() {
        return features;
    }

    public void setFeatures(List<FeatureViewModel> features) {
        this.features = features;
    }

    private ResourceModel resource;
    private List<FeatureViewModel> features;
}
