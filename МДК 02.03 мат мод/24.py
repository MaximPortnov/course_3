import networkx as nx

def find_all_paths(graph_data, start, end):
    graph = nx.DiGraph()
    nodes = {node["id"]: node["mainText"] for node in graph_data["nodes"]}
    edges = [(edge["source"], edge["target"], {"upText": edge["upText"]}) for edge in graph_data["edges"]]
    graph.add_nodes_from(nodes.keys())
    graph.add_edges_from(edges)

    all_paths = nx.all_simple_paths(graph, source=start, target=end)
    paths_with_edge_names = []
    for path in all_paths:
        edge_names = "+".join(graph[path[i]][path[i+1]]["upText"] for i in range(len(path) - 1))
        paths_with_edge_names.append(edge_names)
    return paths_with_edge_names

# Example input JSON (your provided JSON)
# input_json = {
#   "nodes": [
#     {"id": "0", "mainText": "0"},
#     {"id": "1", "mainText": "1"},
#     {"id": "2", "mainText": "2"},
#     {"id": "3", "mainText": "3"},
#     {"id": "4", "mainText": "4"},
#     {"id": "5", "mainText": "5"},
#     {"id": "6", "mainText": "6"},
#     {"id": "7", "mainText": "7"},
#     {"id": "8", "mainText": "8"},
#     {"id": "9", "mainText": "9"},
#     {"id": "10", "mainText": "10"},
#     {"id": "11", "mainText": "11"},
#     {"id": "12", "mainText": "12"},
#   ],
#   "edges": [
#     {"source": "0", "target": "1", "upText": "a1"},
#     {"source": "0", "target": "2", "upText": "a2"},
#     {"source": "0", "target": "3", "upText": "a3"},
#     {"source": "1", "target": "4", "upText": "a4"},
#     {"source": "2", "target": "3", "upText": "a'16"},
#     {"source": "3", "target": "5", "upText": "a5"},
#     {"source": "3", "target": "6", "upText": "a6"},
#     {"source": "4", "target": "7", "upText": "a7"},
#     {"source": "5", "target": "8", "upText": "a8"},
#     {"source": "6", "target": "8", "upText": "a9"},
#     {"source": "7", "target": "9", "upText": "a10"},
#     {"source": "8", "target": "9", "upText": "a11"},
#     {"source": "8", "target": "10", "upText": "a12"},
#     {"source": "9", "target": "11", "upText": "a13"},
#     {"source": "10", "target": "11", "upText": "a14"},
#     {"source": "11", "target": "12", "upText": "a15"}
#   ]
# }

input_json = {
  "nodes": [
    {
      "id": "0",
      "mainText": "0"
    },
    {
      "id": "1",
      "mainText": "2"
    },
    {
      "id": "2",
      "mainText": "3"
    },
    {
      "id": "3",
      "mainText": "4"
    },
    {
      "id": "4",
      "mainText": "5"
    },
    {
      "id": "5",
      "mainText": "6"
    },
    {
      "id": "6",
      "mainText": "7"
    },
    {
      "id": "7",
      "mainText": "8"
    },
    {
      "id": "8",
      "mainText": "9"
    },
    {
      "id": "9",
      "mainText": "10"
    },
    {
      "id": "10",
      "mainText": "11"
    },
    {
      "id": "11",
      "mainText": "12"
    },
    {
      "id": "12",
      "mainText": "13"
    },
    {
      "id": "13",
      "mainText": "14"
    },
    {
      "id": "14",
      "mainText": "15"
    }
  ],
  "edges": [
    {
      "source": "0",
      "target": "1",
      "upText": "A1"
    },
    {
      "source": "0",
      "target": "2",
      "upText": "A2"
    },
    {
      "source": "0",
      "target": "3",
      "upText": "A3"
    },
    {
      "source": "1",
      "target": "5",
      "upText": "A5"
    },
    {
      "source": "1",
      "target": "4",
      "upText": "A4"
    },
    {
      "source": "3",
      "target": "5",
      "upText": "A6"
    },
    {
      "source": "3",
      "target": "6",
      "upText": "A7"
    },
    {
      "source": "4",
      "target": "7",
      "upText": "A8"
    },
      {
          "source": "2",
          "target": "5",
          "upText": "A'18"
      },
    {
      "source": "5",
      "target": "7",
      "upText": "A9"
    },
    {
      "source": "6",
      "target": "8",
      "upText": "A10"
    },
      {
          "source": "7",
          "target": "10",
          "upText": "A11"
      },
    {
      "source": "8",
      "target": "11",
      "upText": "A12"
    },
      {
          "source": "8",
          "target": "10",
          "upText": "A'19"
      },
    {
      "source": "10",
      "target": "9",
      "upText": "A13"
    },
    {
      "source": "9",
      "target": "12",
      "upText": "A14"
    },
    {
      "source": "11",
      "target": "14",
      "upText": "A15"
    },
    {
      "source": "12",
      "target": "13",
      "upText": "A16"
    },
    {
      "source": "13",
      "target": "14",
      "upText": "A17"
    },
  ]
}




# {
#   "nodes": [
#     {"id": "0","mainText": "0"
#     },
#     {"id": "1","mainText": "1"
#     },
#     {"id": "2","mainText": "2"
#     },
#     {"id": "3","mainText": "3"
#     },
#     {"id": "4","mainText": "4"
#     },
#     {"id": "5","mainText": "5"
#     },
#     {"id": "6","mainText": "6"
#     },
#     {"id": "7","mainText": "7"
#     },
#     {"id": "8","mainText": "8"
#     },
#     {"id": "9","mainText": "9"
#     },
#     {"id": "10","mainText": "10"
#     },
#     {"id": "11","mainText": "11"
#     },
#     {"id": "12","mainText": "12"
#     },
#     {"id": "13","mainText": "13"
#     },
#     {"id": "14","mainText": "14"
#     },
#     {"id": "15","mainText": "15"
#     },
#     {"id": "16","mainText": "16"
#     }
#   ],
#   "edges": [
#     {"source": "0","target": "1","upText": "a0"
#     },
#     {"source": "1","target": "2","upText": "a2"
#     },
#     {"source": "2", "target": "5", "upText": "a3"
#     },
#     {"source": "1","target": "3","upText": "a1"
#     },
#     {"source": "3","target": "5","upText": "a6"
#     },
#     {"source": "3","target": "4","upText": "a5"
#     },
#     {"source": "3","target": "6","upText": "a7"
#     },
#     {"source": "2","target": "6","upText": "a4"
#     },
#     {"source": "5","target": "4","upText": "a26"
#     },
#     {"source": "4","target": "7","upText": "a8"
#     },
#     {"source": "7","target": "10","upText": "a13"
#     },
#     {"source": "4","target": "8","upText": "a9"
#     },
#     {"source": "5","target": "8","upText": "a10"
#     },
#     {"source": "6","target": "8","upText": "a11"
#     },
#     {"source": "6","target": "9","upText": "a12"
#     },
#     {"source": "8","target": "11","upText": "a14"
#     },
#     {"source": "9","target": "11","upText": "a15"
#     },
#     {"source": "10","target": "11","upText": "a17"
#     },
#     {"source": "11","target": "13","upText": "a20"
#     },
#     {"source": "9","target": "13","upText": "a16"
#     },
#     {"source": "11","target": "12","upText": "a19"
#     },
#     {"source": "12","target": "13","upText": "a21"
#     },
#     {"source": "12","target": "14","upText": "a22"
#     },
#     {"source": "13","target": "15","upText": "a23"
#     },
#     {"source": "15","target": "16","upText": "a25"
#     },
#     {"source": "14","target": "16","upText": "a24"
#     },
#   ]
# }

# edge_values = { "a1": 5, "a2": 1, "a3": 5, "a4": 2, "a5": 20, "a6": 15, "a7": 5, "a8": 5, "a9": 4, "a10": 25, "a11": 3, "a12": 5, "a13": 4, "a14": 5, "a15": 1, "a'16": 0}
# edge_values = {"a0": 1,"a1": 2,"a2": 4,"a3": 0,"a4": 2,"a6": 2,"a5": 1,"a9": 1,"a10": 3,"a11": 5,"a7": 1,"a14": 8,"a8": 2,"a13": 2,"a17": 12,"a12": 2,"a16": 3,"a15": 2,"a20": 5,"a19": 1,"a21": 0,"a22": 13,"a23": 10,"a24": 3,"a25": 3,"a26": 3}
edge_values = {
    "A1": 5,
    "A2": 6,
    "A3": 3,
    "A4": 9,
    "A5": 6,
    "A6": 1,
    "A7": 4,
    "A8": 2,
    "A9": 10,
    "A10": 11,
    "A11": 12,
    "A12": 7,
    "A13": 8,
    "A14": 2,
    "A15": 1,
    "A16": 15,
    "A17": 11,
    "A'18": 12,
    "A'19": 13
}
# Specify the start and end nodes for finding paths
start_node = "0"
end_node = "14"

# Find all paths and print them
paths = find_all_paths(input_json, start_node, end_node)
for i, path in enumerate(paths):
    numbers = [edge_values[edge] for edge in path.split("+")]
    path_sum = sum(numbers)
    print(f"T{i} = {path} = {' + '.join(map(str, numbers))} = {path_sum}")

tab = {}
str1 = []
str2 = []
for num, name in enumerate(input_json['edges']):
    tab[name["upText"]] = []
    ii = int(name['source'])
    jj = int(name["target"])
    ff = int(edge_values[name["upText"]])
    tab[name["upText"]].append(ii)
    tab[name["upText"]].append(jj)
    tab[name["upText"]].append(int(edge_values[name["upText"]]))

    a = [i["upText"] for i in input_json["edges"] if i["target"] == name["source"]]
    # print(a)
    b = [(tab[i][4]) for i in a]
    r = 0 if not b else max(b)

    str1.append("")
    str1[-1] += f"t_{ii}^PCC = max("
    if a:
        str1[-1] += f"{', '.join([f't_{int(tab[i][0])}^PCC + t_{int(tab[i][0])}-{ii}' for i in a])}"
    else:
        str1[-1] += f"{', '.join([f't_0^PCC + t_0-{ii}'])}"
    str1[-1] += ") = max("
    if a:
        str1[-1] += f"{', '.join([f'{int(tab[i][3])} + {int(tab[i][2])}' for i in a])}"
    else:
        str1[-1] += f"{', '.join([f'0 + 0'])}"
    str1[-1] += ") = "
    str1[-1] += str(r)

    str2.append("")
    str2[-1] += f"t_{jj}^PCC = max("
    if a:
        str2[-1] += f"{', '.join([f't_{int(tab[i][0])}^PCC + t_{int(tab[i][0])}-{jj}' for i in a])}"
    else:
        str2[-1] += f"{', '.join([f't_0^PCC + t_0-{jj}'])}"
    str2[-1] += ") = max("
    if a:
        str2[-1] += f"{', '.join([f'{int(tab[i][4])} + {ff}' for i in a])}"
    else:
        str2[-1] += f"{', '.join([f'0 + {ff}'])}"
    str2[-1] += ") = "
    str2[-1] += str(r+edge_values[name["upText"]])

    tab[name["upText"]].append(r)
    tab[name["upText"]].append(r+edge_values[name["upText"]])
    # print(b)
    # print(str(num) + '\t' + name["upText"] + '\t' + '\t'.join(tab[name["upText"]]))
print('\n\n')
# for i in str2:
#     print(i)
d = 42
str3 = []
str4 = []
for num, name in enumerate(input_json['edges'][::-1]):
    # tab[name["upText"]] = []
    ii = int(name['source'])
    jj = int(name["target"])
    ff = int(edge_values[name["upText"]])
    # tab[name["upText"]].append(name["source"])
    # tab[name["upText"]].append(name["target"])
    # tab[name["upText"]].append(str(edge_values[name["upText"]]))
    #
    a = [i["upText"] for i in input_json["edges"][::-1] if i["source"] == name["target"]]
    # print(a)
    b = [int(tab[i][5]) for i in a]
    # print(b)
    vv = int(tab[name["upText"]][4])
    r =vv if not b else min(b)
    ss = str3
    ss.append("")
    ss[-1] += f"t_{ii}^ПСС = min("
    if a:
        ss[-1] += f"{', '.join([f't_{int(tab[i][0])}^ПCC - t_{ii}-{int(tab[i][0])}' for i in a])}"
    else:
        ss[-1] += f"{', '.join([f't_{ii+1}^ПCC - t_{ii}-{ii+1}'])}"
    ss[-1] += ") = min("
    if a:
        ss[-1] += f"{', '.join([f'{int(tab[i][5])} - {ff}' for i in a])}"
    else:
        ss[-1] += f"{', '.join([f'{vv} - {ff}'])}"
    ss[-1] += ") = "
    ss[-1] += str(r-edge_values[name["upText"]])

    ss = str4
    ss.append("")
    ss[-1] += f"t_{jj}^ПСС = min("
    if a:
        ss[-1] += f"{', '.join([f't_{int(tab[i][1])}^ПCC - t_{jj}-{int(tab[i][1])}' for i in a])}"
    else:
        ss[-1] += f"{', '.join([f't_{jj+1}^ПCC - t_{jj}-{jj+1}'])}"
    ss[-1] += ") = min("
    if a:
        ss[-1] += f"{', '.join([f'{int(tab[i][6])} - {int(tab[i][2])}' for i in a])}"
    else:
        ss[-1] += f"{', '.join([f'{vv} - {0}'])}"
    ss[-1] += ") = "
    ss[-1] += str(r)

    tab[name["upText"]].append(r-edge_values[name["upText"]])
    tab[name["upText"]].append(r)
    # print(b)
    # print(str(15 - num) + '\t' + name["upText"] + '\t' + '\t'.join(tab[name["upText"]]))

str5 = []
str6 = []
str7 = []
str8 = []


for num, name in enumerate(input_json['edges']):
    line = tab[name["upText"]]
    line.append(line[6] - line[3] - line[2])
    str5.append(f"({name['upText']}) R_п = {line[6]} - {line[3]} - {line[2]} = {line[6] - line[3] - line[2]}")
    line.append(line[6] - line[5] - line[2])
    str6.append(f"({name['upText']}) R_c^1 = {line[6]} - {line[5]} - {line[2]} = {line[6] - line[5] - line[2]}")
    line.append(line[4] - line[3] - line[2])
    str7.append(f"({name['upText']}) R_c^2 = {line[4]} - {line[3]} - {line[2]} = {line[4] - line[3] - line[2]}")
    line.append(line[4] - line[5] - line[2])
    str8.append(f"({name['upText']}) R_н = {line[4]} - {line[5]} - {line[2]} = {line[4] - line[5] - line[2]}")

    print(str(num) + '\t' + name["upText"] + '\t' + '\t'.join(map(str, tab[name["upText"]])))



for i in str1:
    print(i)
print()
for i in str2:
    print(i)
print()
for i in str3:
    print(i)
print()
for i in str4:
    print(i)
print()
for i in str5:
    print(i)
print()
for i in str6:
    print(i)
print()
for i in str7:
    print(i)
print()
for i in str8:
    print(i)
print()
