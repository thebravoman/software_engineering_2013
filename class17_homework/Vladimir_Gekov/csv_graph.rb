require 'csv'
require_relative 'vertex'
class CSV_to_graph
        attr_accessor :vs
        attr_accessor :edges
        
        def initialize name
                File.exist?(name) ? @name = name : @name = "../" + name
                self.vs = []
                self.edges = []
        end
        
        def create_vs
                i=0
                CSV.foreach(@name) do |row|
                        if i>0
                                j=1
                                k=1
                                vs.each_index do |n|
                                        if vs[n].name==row[0]
                                                j=0
                                        end
                                        if vs[n].name==row[1]
                                                k=0
                                        end
                                end
                                if j==1 && k==1
                                        vs << Vertex.new(row[0])
                                        vs << Vertex.new(row[1])
                                elsif j==1
                                        vs << Vertex.new(row[0])
                                elsif k==1
                                        vs << Vertex.new(row[1])
                                end
                        else
                                vs << Vertex.new(row[0])
                                vs << Vertex.new(row[1])
                                i+=1
                        end
                end
                return vs
        end
        
        def create_edges
                i=0
                j=0
                CSV.foreach(@name) do |row|
                        vs.each_index do |n|
                                if vs[n].name==row[0]
                                        i=n
                                end
                                if vs[n].name==row[1]
                                        j=n
                                end
                        end
                        edges << [vs[i],vs[j]]
                end
                return edges
        end
end
