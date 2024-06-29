use std::collections::VecDeque;
impl Solution {
    pub fn get_ancestors(n: i32, edges: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let n = n as usize;
        let mut graph = vec![Vec::new(); n];
        let mut in_degree = vec![0; n];

        for edge in edges {
            graph[edge[0] as usize].push(edge[1] as usize);
            in_degree[edge[1] as usize] += 1;
        }

        let mut output = vec![Vec::new(); n];
        let mut queue = in_degree
            .iter()
            .enumerate()
            .filter_map(|(i, &degree)| (degree == 0).then(|| i))
            .collect::<VecDeque<usize>>();

        while let Some(i) = queue.pop_front() {
            output[i].sort();
            output[i].dedup();
            for &j in graph[i].iter() {
                let i_ancestors = output[i].clone();
                output[j].extend(i_ancestors);
                output[j].push(i as i32);
                in_degree[j] -= 1;
                if in_degree[j] == 0 {
                    queue.push_back(j);
                }
            }
        }
        output
    }
}